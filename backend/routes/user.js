const express = require("express");
const router = express.Router();
const userController = require("../controllers/user");
const authController = require("../controllers/auth");

/**
 * routes getting 'filtered' through middlewares
 */
router.get('/notifications/:userId', userController.getNotifications);

router.get("/users", userController.allUsers);

router.get(
  "/user/:userId",
  authController.requireSignin,
  userController.getUser
);

router.put(
  "/user/:userId",
  authController.requireSignin,
  userController.hasAuthorization,
  userController.updateUser
);


router.delete(
  "/user/:userId",
  authController.requireSignin,
  userController.hasAuthorization,
  userController.deleteUser
);

router.get("/user/photo/:userId", userController.userPhoto);

router.post("/user/addcard/:userId",
userController.addCard,
);

router.post("/user/addwallet/:userId",
userController.addWallet,
);

router.post("/user/toogleCrypto/:userId",
userController.changeCryptoPreference,
);

router.post("/user/cardDestination/:userId",
userController.cardDestination,
);

//userById() with be executed in routes that have :userId
router.param("userId", userController.userById);

module.exports = router;
