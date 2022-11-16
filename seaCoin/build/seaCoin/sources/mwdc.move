module sea_coin::mwdc {

    use aptos_framework::coin;
    use std::string;
    use aptos_framework::coin::{BurnCapability,MintCapability};
    use std::signer;
    
    struct MWDC has key {}
    
    struct HoldCap has key {
        burn: BurnCapability<MWDC>,
        mint: MintCapability<MWDC>,
    }

    public entry fun init(singer: &signer) {
        let (burn,freeze,mint) = coin::initialize<MWDC>(
           singer,
           string::utf8(b"MWDC"),
           string::utf8(b"mwdc"),
           8,
           true,
        );

        coin::destroy_freeze_cap(freeze);

        move_to(singer,HoldCap{
            burn,
            mint
        });
    }

    public entry fun mint_mwdc(singer: &signer,mount: u64) acquires HoldCap {
     let cap = borrow_global<HoldCap>(@sea_coin);
     let coin = coin::mint(mount,&cap.mint);
      
     if(!coin::is_account_registered<MWDC>(signer::address_of(singer))){
        coin::register<MWDC>(singer);
     };
     coin::deposit(signer::address_of(singer),coin);
    }

    // public entry fun mint_me(singer: &signer, amount: u64)acquires HoldCap {
    //     let cap = borrow_global<HoldCap>(@sea_coin);
    //     let coin = coin::mint(amount, &cap.mint);

    //     if(!coin::is_account_registered<MWDC>(signer::address_of(singer))){
    //         coin::register<MWDC>(singer);
    //     };

    //     coin::deposit(signer::address_of(singer), coin);
    // }
    
} 