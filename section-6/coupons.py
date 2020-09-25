from config import COUPONS
import random
from robot.api import logger
from robot.api.deco import keyword 

class Coupons():
  @keyword('get a valid coupon')
    def get_valid_couponds(self):
        logger.console('Getting valid coupons...')
        return random.choice(COUPONS['valid'])

  @keyword('get an expired coupon')
    def get_experied_couponds(self):
        logger.console('Getting expired coupons...')
        return random.choice(COUPONS['expired'])
