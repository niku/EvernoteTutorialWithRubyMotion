class TestAuthController < UIViewController
  def viewDidLoad
    super
    @button = UIButton.buttonWithType UIButtonTypeRoundedRect
    @button.setTitle 'auth', forState: UIControlStateNormal
    @button.sizeToFit
    @button.addTarget(self, action: 'testEvernoteAuth', forControlEvents: UIControlEventTouchUpInside)
    self.view.addSubview @button
  end

  def testEvernoteAuth
    session = EvernoteSession.sharedSession
    NSLog("Session host: %@", session.host)
    NSLog("Session key: %@", session.consumerKey)
    NSLog("Session secret: %@", session.consumerSecret)

    session.authenticateWithViewController(self,
                                           completionHandler: -> error {
                                             if (error || !session.isAuthenticated)
                                               if (error)
                                                 NSLog("Error authenticating with Evernote Cloud API: %@", error)
                                               end
                                               if (!session.isAuthenticated)
                                                 NSLog("Session not authenticated")
                                               end
                                             else
                                               # We're authenticated!
                                               userStore = EvernoteUserStore.userStore
                                               userStore.getUserWithSuccess(
                                                 -> user {
                                                   # success
                                                   NSLog("Authenticated as %@", user.username)
                                                 },
                                                 failure: -> error2 {
                                                   # failure
                                                   NSLog("Error getting user: %@", error2)
                                                 }
                                               )
                                             end
                                           })
  end
end
