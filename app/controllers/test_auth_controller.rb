class TestAuthController < UIViewController
  def viewDidLoad
    super
    @button = UIButton.buttonWithType UIButtonTypeRoundedRect
    @button.setTitle 'auth', forState: UIControlStateNormal
    @button.sizeToFit
    self.view.addSubview @button
  end
end
