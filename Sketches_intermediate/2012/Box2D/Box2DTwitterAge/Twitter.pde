ArrayList twitter_statuses; 

class Twitter
{
  String[] statuses_offline = {
  "test texte un peu plus long",
  "hello",
  "processing paris 2012",
  "processing twitter et box2D !"
  };
  
  
  String keyword;

  float periodNextStatus;
  float period = 0.0;
  float time=0.0;

  boolean isOnline = false;
  //boolean isOnline = true;
  int offlineIndex = 0;

  Twitter(String k, float period, boolean online)
  {
    periodNextStatus = period;
    keyword = k;
    twitter_statuses = new ArrayList();
    isOnline = online;
  }

    void setup()
    {
      if (isOnline)
      {
        // Configuration builder est simplement un objet qui stocke 
        // l'information d'application / authentification d'une application Twitter
        // Passé en paramètre à l'instance de Twitter Stream
        ConfigurationBuilder cb = new ConfigurationBuilder();
        cb.setDebugEnabled(false)
          .setOAuthConsumerKey("EVKwOBXgjqDfSEwcJZ6w")
          .setOAuthConsumerSecret("sabXLiecGpie6847R6wn8zIA81jo72FKFByd8whnJ0")
          .setOAuthAccessToken("8675642-pdhPsd0I1UfZgl6BDdpdvlYt0tZXTic9z6zlGPMmok")
          .setOAuthAccessTokenSecret("BXGXpyZ77lBsJQiWjZddxj5BO0FB670VOx2bRsJMmE");  

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
        if (isOnline)
        {
          if (twitter_statuses.size() > 0) 
          {
            Status currentStatus = (Status)twitter_statuses.remove(0);
            return currentStatus.getText();
          }
        }
        else
        {
          String s =  statuses_offline[offlineIndex];
          offlineIndex = (offlineIndex+1)%statuses_offline.length;
          return s;
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
      println(status.getUser().getName() + " : " + status.getText());
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


