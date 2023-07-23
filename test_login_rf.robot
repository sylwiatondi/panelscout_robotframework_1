import unittest
from selenium.webdriver.chrome import webdriver


*** Test Cases ***
Test title
    [Tags]    DEBUG
    Provided precondition
    When action
    Then check expectations

*** Keywords ***
Provided precondition
    Setup system under test



class TestLoginPage(unittest.TestCase):


@classmethod
def setUp(self):
    os.chmod(DRIVER_PATH, 755)
    self.driver = webdriver.Chrome(service=self.driver_service)
    self.driver.get('https://scouts-test.futbolkolektyw.pl/en')
    self.driver.fullscreen_window()
    self.driver.implicitly_wait(IMPLICITLY_WAIT)

def test_log_in_to_the_system(self):
    user_login = LoginPage(self.driver)
    user_login.title_of_page() #check if the title of the opened page is correct
    user_login.type_in_email('user08@getnada.com')
    user_login.enter_password('Test-1234')
    user_login.click_sign_in_button()
    dashboard_page = Dashboard(self.driver)
    dashboard_page.title_of_page_dashboard()



@classmethod
def tearDown(self):
    self.driver.quit()

