#[test_only]
 module devhub::devcard_test {
    use devhub::devcard::{Self, DevCard, DevHub};
    use sui::object_table::{Self, ObjectTable};
    
    use sui::test_scenario as ts;
  
    use sui::sui::SUI;
    use sui::coin::{Self, Coin, mint_for_testing, CoinMetadata};


    use std::option::{Self, Option};
    use std::string::{Self, String};
    
    use sui::transfer;
    use sui::object::{Self, UID, ID};
    use sui::tx_context::{Self, TxContext};
    use sui::url::{Self, Url};
    use sui::event;

    #[test]
    fun test_create_card() {

     let owner: address = @0xA;
     let user1: address = @0xB;
     let user2: address = @0xC;
     let name = b"Test Name";
     let title = b"Test Title";
     let img_url = b"https://test.com/image.png";
     let years_of_exp = 5;
     let technologies = b"Rust, Move";
     let portfolio = b"https://test.com/portfolio";
     let contact = b"test@test.com";

     let scenario_val = ts::begin(owner);
     let scenario = &mut scenario_val;

     ts::next_tx(scenario, owner);

     {
        devcard::init_for_testing(ts::ctx(scenario));

     };

     ts::next_tx(scenario, user1);

     {
        let name = b"berkay";
        let title = b"dsa";
        let img_url = b"https://hizliresim.com/q82e6jw";
        let years:u64 = 31;
        let technologies = b"java";
        let portfolio = b"asd";
        let contract = b"dsad";
        let payment = mint_for_testing<SUI>(100, ts::ctx(scenario));
        let devcard_share = ts::take_shared<DevHub>(scenario);

        devcard::create_card(name,title, img_url, years, technologies, portfolio, contact, payment, &mut devcard_share, ts::ctx(scenario));

        ts::return_shared(devcard_share);

     };



     ts::end(scenario_val);


}

 #[test]
    fun test_create_card() {

     let owner: address = @0xA;
     let user1: address = @0xB;
     let user2: address = @0xC;
  

     let scenario_val = ts::begin(owner);
     let scenario = &mut scenario_val;

     ts::next_tx(scenario, owner);

     {
    devcard::init_for_testing(ts::ctx(scenario));

     };

     ts::next_tx(scenario, user1);

     {
   

     };



     ts::end(scenario_val);


}



 }