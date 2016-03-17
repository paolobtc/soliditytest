//unfinished and not tested :(

contract personal_pages {

  address contract_owner;

  struct personal_page 
  { string nickname; string dob; string bio; string twitter_link; string github_link; string linkedin_link; }

  mapping(address => personal_page) public pages;

  modifier only_owner() { if (msg.sender != contract_owner){ abort_contract(); } } //?
	
  function set_owner() { contract_owner = msg.sender; }

  function create_new_profile(string nickname, string dob, string bio, string twitter_link, string github_link, string linkedin_link) returns(bool result)
 {
   bool res = false; //maybe add a check to see if a profile already exists by nickname
   //personal_page _pages = pages[msg.sender]; 
   pages[msg.sender].nickname = nickname; pages[msg.sender].dob = dob; pages[msg.sender].bio = bio;
   pages[msg.sender].twitter_link = twitter_link;
   pages[msg.sender].github_link = github_link;
   pages[msg.sender].linkedin_link = linkedin_link;
   res = true;
   return res;
 }

 function edit_profile(string nickname, string dob, string bio, string twitter_link, string github_link, string linkedin_link) returns(bool result) 
{
   if (msg.sender != contract_owner) { abort_contract(); } //only the contract owner can edit a profile
   bool res = false; //maybe add error checking
   //personal_page _pages = pages[msg.sender]; 
   pages[msg.sender].nickname = nickname; pages[msg.sender].dob = dob; pages[msg.sender].bio = bio;
   pages[msg.sender].twitter_link = twitter_link;
   pages[msg.sender].github_link = github_link;
   pages[msg.sender].linkedin_link = linkedin_link;
   res = true;
   return res;
}

 function get_profile_info() returns(string nickname, string dob, string bio, string twitter_link, string github_link, string linkedin_link) 
 { 
   return (pages[msg.sender].nickname, pages[msg.sender].dob, pages[msg.sender].bio, pages[msg.sender].twitter_link, pages[msg.sender].github_link , pages[msg.sender].linkedin_link); 
 } 
	
 function abort_contract() { if (msg.sender == contract_owner) { suicide(contract_owner); } } //abandon ship, only contract owner can call it
}
