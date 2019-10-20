
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsManager {

  static const String _USERNAME_KEY = 'username';
  static const String _INVENTORY_KEY = 'inventory';
  static const String _CURRENCY_KEY = 'currency';
  static const String _PURCHASES_KEY = 'purchases';

  static SharedPrefsManager _instance;
  static SharedPreferences _preferences;
  static Future<SharedPrefsManager> getInstance() async {
    if (_instance == null) {
      _instance = SharedPrefsManager();
    }
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
    return _instance;
  }

  Future<bool> setUsername(String username) async {
    return _preferences.setString(_USERNAME_KEY, username);
  }

  String getUsername() {
    return _preferences.getString(_USERNAME_KEY) ?? '';
  }

  Future<bool> setInventory(String inventory) async {
    return _preferences.setString(_INVENTORY_KEY, inventory);
  }

  String getInventory() {
    return _preferences.getString(_INVENTORY_KEY) ?? '';
  }

  Future<bool> setCurrency(int currency) {
    return _preferences.setInt(_CURRENCY_KEY, currency);
  }

  int getCurrency() {
    return _preferences.getInt(_CURRENCY_KEY) ?? '';
  }

  

  Future<bool> setPurchase(String purchaseId) async {
    List<String> purchases = _preferences.getStringList(_PURCHASES_KEY) ?? [];
    if(!purchases.contains(purchaseId)) purchases.add(purchaseId);
    return _preferences.setStringList(_PURCHASES_KEY, purchases);
  }

  List<String> getPurchases(){
    return _preferences.getStringList(_PURCHASES_KEY) ?? [];
  }

  Future<bool> clear() async {
    return _preferences.clear();
  }


}