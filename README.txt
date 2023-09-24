Admin: userID:admin	password:admin

Customer Representative: userID:rep	password:rep

group leader: Xuyang Wang
#Notes about the project
1. For the auction “sold” attribute, we only update it when the winning bidder confirms his/her status on the auction. So when the user checks and confirms, the item will be sold (only when the final bid >=min_price that the seller set). 
2. For automatic auction, we restricted the increment to 1-5 because we’re taking the shortcut of directly using the current highest bidding price + increment. And if the bidder didn’t type any value, we set it to 0 and only send these buyers alerts instead of auto-bidding for them. 
3. For viewing similar items, we didn’t complete the design, therefore the data you see on sim.jsp may not be accurate. 
4. For admin, we still put he/her in the account table, and his/her name can only be admin in our case. 
5. For sorting search, we only used two filters instead of multiple filters.


Demo Video: https://drive.google.com/file/d/1BLnQhxIKJaaLvJxQoWGzVunss0B8g7zj/view?usp=share_link 
