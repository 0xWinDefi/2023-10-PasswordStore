// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

/*
 * @author not-so-secure-dev
 * @title PasswordStore
 * @notice This contract allows you to store a private password that others won't be able to see.
 * You can update your password at any time.
 */
contract PasswordStore {
    error PasswordStore__NotOwner();

    address private s_owner;
    string private s_password; // bug H1: can be seen by anyone

    event SetNetPassword();

    constructor() {
        s_owner = msg.sender;

        // bug L0: initialize the password
        s_password = "initialPassword";
    }

    /*
     * @notice This function allows only the owner to set a new password.
     * @param newPassword The new password to set.
     */
    function setPassword(string memory newPassword) external {
        // bug H2: add sender check to ensure only the owner can set the password
        if (msg.sender != s_owner) {
            revert PasswordStore__NotOwner();
        }

        s_password = newPassword;
        emit SetNetPassword();
    }

    /*
     * @notice This allows only the owner to retrieve the password.
     * @return The current password.
     */
    function getPassword() external view returns (string memory) {
        if (msg.sender != s_owner) {
            revert PasswordStore__NotOwner();
        }
        return s_password;
    }
}
