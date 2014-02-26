class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    evernote_host = BootstrapServerBaseURLStringSandbox
    consumer_key = MY_ENV['CONSUMER_KEY']
    consumer_secret = MY_ENV['CONSUMER_SECRET']

    EvernoteSession.setSharedSessionHost(evernote_host, consumerKey: consumer_key, consumerSecret: consumer_secret)

    true
  end
end
