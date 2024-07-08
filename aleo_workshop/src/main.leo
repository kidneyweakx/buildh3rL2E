// The 'bxl_2819343' program.
program bxl_2819343.aleo {
    record Token {
        // The token owner, any record must be defined with the `owner` field.
        owner: address,
        // Token balance of the user.
        amount: u64,
    }

    transition mint(owner: address, amount: u64) -> Token {
        return Token {
            owner: owner,
            amount: amount,
        };
    }

    transition transfer(token: Token, to: address, amount: u64) -> (Token, Token) {
        let difference: u64 = token.amount - amount;

        let remaining: Token = Token {
            owner: token.owner,
            amount: difference,
        };
        let transferred: Token = Token {
            owner: to,
            amount: amount,
        };

        // Output the sender's change record and the receiver's record.
        return (remaining, transferred);
    }

    transition balance_of(owner_balance: Token) -> u64 {
        return owner_balance.amount;
    }
}
