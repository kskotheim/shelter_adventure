import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelter_adventure/components/game/game_logic.dart';
import 'package:shelter_adventure/components/inventory/inventory.dart';
import 'package:shelter_adventure/components/inventory/inventory_logic.dart';
import 'package:shelter_adventure/components/inventory/item_list.dart';

class InventoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GameLogic gameLogic = Provider.of<GameLogic>(context);
    InventoryLogic inventoryLogic = InventoryLogic(gameLogic: gameLogic);

    return Provider<InventoryLogic>(
      builder: (context) => inventoryLogic,
      dispose: (context, _) => inventoryLogic.dispose(),
      child: Scaffold(
        body: Center(
          child: StreamBuilder<Inventory>(
              stream: inventoryLogic.inventoryStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                List<Widget> equippedItems = snapshot.data.equippedItems
                    .map((item) => Text(item.name))
                    .toList();

                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('Inventory:'),

                    // a list of equipped items
                    Text('Equipped Items: '),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: equippedItems,
                    ),

                    // a list of all the items
                    Column(
                      children: <Widget>[
                        Text('Items:'),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: List<Widget>.from(theItems
                              .map((item) => ItemSelectionTile(
                                    item: item,
                                  ))
                              .toList()),
                        ),
                      ],
                    ),

                    FlatButton(
                      child: Text('Title'),
                      onPressed: gameLogic.showTitleScreen,
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}

class ItemSelectionTile extends StatelessWidget {
  final Item item;

  ItemSelectionTile({this.item});

  @override
  Widget build(BuildContext context) {
    InventoryLogic inventoryLogic = Provider.of<InventoryLogic>(context);
    GameLogic gameLogic = Provider.of<GameLogic>(context);
    return ListTile(
      title: Text(item.name),
      subtitle: Text(item.effectString),
      trailing: gameLogic.inventory.equippedItemIds.contains(item.itemId)
          ? Icon(
              Icons.check,
              color: Colors.green,
            )
          : null,
      onTap: () => inventoryLogic.itemButtonPressed(item.itemId),
    );
  }
}
