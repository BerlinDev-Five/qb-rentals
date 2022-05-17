# Script Working With Only QBCore Framework Latest Version


* [Project XG Community](https://discord.gg/Nh8WscE6ck) 


# Dependencies
* [qb-target](https://github.com/BerkieBb/qb-target)
* [qb-menu](https://github.com/qbcore-framework/qb-menu)

## Preview
* qb-target
https://cdn.discordapp.com/attachments/967841474152648825/967842076022698083/FiveM_by_Cfx.re_-_Project_RS___Highly_Optimized___Custom_Latest_Framework_24-04-2022_22_50_18.png

* qb-menu
https://cdn.discordapp.com/attachments/967841474152648825/967845113596358746/FiveM_by_Cfx.re_-_Project_RS___Highly_Optimized___Custom_Latest_Framework_24-04-2022_23_17_01.png

* after car buying check inventory you got a rentalpapers
https://cdn.discordapp.com/attachments/967841474152648825/967844758938587238/FiveM_by_Cfx.re_-_Project_RS___Highly_Optimized___Custom_Latest_Framework_24-04-2022_23_17_38.png

* when you lost your cars keys use rentalpapers you got the keys
https://cdn.discordapp.com/attachments/967841474152648825/967844759236399155/FiveM_by_Cfx.re_-_Project_RS___Highly_Optimized___Custom_Latest_Framework_24-04-2022_23_17_48.png

* got keys
https://cdn.discordapp.com/attachments/967841474152648825/967844759865524394/FiveM_by_Cfx.re_-_Project_RS___Highly_Optimized___Custom_Latest_Framework_24-04-2022_23_17_53.png


# Setup

* Find this in **qb-target/init**
* Put this in **"Config.TargetModels"**
```lua
    ["VehicleRental"] = {
        models = {
            `a_m_y_business_03`,
        },
        options = {
            {
                type = "client",
                event = "qb-rental:openMenu",
                icon = "fas fa-car",
                label = "Rent Vehicle",
            },
        },
        distance = 2.0
    },

}
```
# Rental Papers Item - qb-core/shared/items.lua

```
["rentalpapers"]				 = {["name"] = "rentalpapers", 					["label"] = "Rental Papers", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "rentalpapers.png", 		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true, 	["combinable"] = nil, 	["description"] = "It's Rental Vehicle Proof!"},
```
# Rental Papers Item Description - qb-inventory/html/js/app.js (Line 546)

```lua
        } else if (itemData.name == "stickynote") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>' + itemData.info.label + '</p>');
        } else if (itemData.name == "rentalpapers") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p><strong>Name: </strong><span>'+ itemData.info.firstname + '</span></p><p><strong>Last Name: </strong><span>'+ itemData.info.lastname+ '</span></p><p><strong>Plate: </strong><span>'+ itemData.info.plate + '<p><strong>Model: </strong><span>'+ itemData.info.model +'</span></p>');
```



* Credits - itsHyper

* Any problem related this script join our discord server and contact with admin
* [Discord](https://discord.gg/Nh8WscE6ck)
