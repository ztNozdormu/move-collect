module foot_ball_star::ball_star_card {
    use aptos_framework::coin;
    use std::string::String;
    use std::signer;

    const STAR_ALREADY_EXIST: u64 = 500;
    const STAR_NOT_EXIST: u64 = 501;

    struct BallStarCard has key,store {
        name: String,
        nation: String,
        playNo: u8,
        worth: u8,
    }

    public fun newBallStarCard(name: String, nation: String, playNo: u8): BallStarCard {
         BallStarCard {
              name,
              nation, 
              playNo,
              worth: 0,
         }
    }

    public fun mint(dest: &signer,ballStar: BallStarCard) {
        assert!(!exists<BallStarCard>(signer::address_of(dest)),STAR_ALREADY_EXIST);
        move_to(dest,ballStar);
    }

    public fun getBallStarInfo(owner: address): (String,String,u8,u8) acquires BallStarCard {
        assert!(exists<BallStarCard>(owner),STAR_NOT_EXIST);
        let star_card = borrow_global<BallStarCard>(owner);
        (star_card.name, star_card.nation, star_card.playNo, star_card.worth)
    }

    public fun setBallStarPrice(owner: address,price: u8) acquires BallStarCard {
        assert!(exists<BallStarCard>(owner),STAR_NOT_EXIST);
        let mut_star_card = borrow_global_mut<BallStarCard>(owner);
        mut_star_card.worth = price;
    }

    public fun transfer(source: &signer, dest:  &signer) acquires BallStarCard {

         assert!(exists<BallStarCard>(signer::address_of(source)),STAR_NOT_EXIST);
         let mut_star_card = move_from<BallStarCard>(signer::address_of(source));
         mut_star_card.worth = mut_star_card.worth + 10;
         assert!(!exists<BallStarCard>(signer::address_of(dest)),STAR_ALREADY_EXIST);
         move_to<BallStarCard>(dest,mut_star_card);

    }
}