ArrayList twitter_statuses; 

class Twitter
{

  String keyword;

  float periodNextStatus;
  float period = 0.0;
  float time=0.0;


  Twitter(String k, float period)
  {
    periodNextStatus = period;
    keyword = k;
    twitter_statuses = new ArrayList();
  }

    void setup()
    {
      // Configuration builder est simplement un objet qui stocke 
      // l'information d'application / authentification d'une application Twitter
      // Passé en paramètre à l'instance de Twitter Stream
      ConfigurationBuilder cb = new ConfigurationBuilder();
      cb.setDebugEnabled(false)
        .setOAuthConsumerKey("YOUR_CONSUMER_KEY_HERE")
          .setOAuthConsumerSecret("YOUR_CONSUMER_SECRET_HERE")
            .setOAuthAccessToken("YOUR_ACCESS_TOKEN_HERE")
              .setOAuthAccessTokenSecret("YOUR_ACCESS_TOKEN_SECRET_HERE");  

      // Objet qui permet de récupérer les tweets
      TwitterStream ts = new TwitterStreamFactory(cb.build()).getInstance();

      // Filter Query est un objet qui permet de faire une requête sur la base de données de Twitter
      // en fonction de paramètres (par exemple des mots clés)
      FilterQuery filterQuery = new FilterQuery(); 
      filterQuery.track(new String[] {
        keyword
      }
      ); 

      // On fait le lien entre le TwitterStream (qui récupère les messages) et notre écouteur  
      ts.addListener(new TwitterListener());

      // On démarre la recherche !
      ts.filter(filterQuery);
    }

    String update()
    {
      period += millis() - time;
      time = millis();

      // Plus grand que notre période ? 
      if (period/1000 >= periodNextStatus)
      {
        // Ré-initialise
        period = 0.0;

        // On prend le premier message dans la liste (= le plus ancien)
        // Puis on l'affiche
        if (twitter_statuses.size() > 0) 
        {
          Status currentStatus = (Status)twitter_statuses.remove(0);
          return currentStatus.getText();
        }
      }
    
      return null;
    }
  };


  // ------------------------------------------------------------
  // class TwitterListener
  //
  // Classe qui permet "d'écouter" les messages entrants
  // récupérés par notre instance TwitterStream
  // ------------------------------------------------------------
  class TwitterListener implements StatusListener
  {
    // onStatus : nouveau message qui vient d'arriver 
    public void onStatus(Status status) 
    {
      //println(status.getUser().getName() + " : " + status.getText());
      twitter_statuses.add(status);
    }  

    // onDeletionNotice
    public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) 
    {
    }

    // onTrackLimitationNotice
    public void onTrackLimitationNotice(int numberOfLimitedStatuses) {
    }  

    // onScrubGeo : récupération d'infos géographiques
    public void onScrubGeo(long userId, long upToStatusId) 
    {
      System.out.println("Got scrub_geo event userId:" + userId + " upToStatusId:" + upToStatusId);
    }

    // onException : une erreur est survenue (déconnexion d'internet, etc...)
    public void onException(Exception ex) 
    {
      ex.printStackTrace();
    }
  }

