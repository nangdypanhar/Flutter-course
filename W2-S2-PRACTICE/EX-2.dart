class BankAccount {
  //  final String accountId;
  final String accoutName;
  double _balance;
  final int _accountId;
  static int nextAcc = 1;

  int get accountId => _accountId;
  double get balance => _balance;

  BankAccount({required this.accoutName, required double balance})
      : _balance = balance,
        _accountId = nextAcc++;

  void deposit({required double amount}) {
    this._balance += amount;
  }

  void withdrawa({required double amount}) {
    if (amount > balance) {
      print("Insufficient balance for withdrawal!");
    } else {
      this._balance -= amount;
    }
  }

  void printDetails() {
    print("Accout name: $accoutName,\nBalance : \$$balance");
  }

  @override
  String toString() {
    return '\n Account ID : $accountId, \n Username : $accoutName, \n Balance : \$$balance \n';
  }
}

class Bank {
  final String name;
  Set<BankAccount> accounts = {};
  Bank({required this.name});

  void addAccount(BankAccount newAcc) {
    this.accounts.add(newAcc);
  }

  @override
  String toString() {
    return 'Bank Name : $name, \nAccount List : $accounts';
  }
}

void main() {
  // BankAccount myAcc = BankAccount(2500, accoutName: "Nangdy Panhar");
  // print(myAcc.balance);
  BankAccount acc1 = BankAccount(accoutName: "Nangdy Panhar", balance: 2500);
  BankAccount acc2 = BankAccount(accoutName: "Mann Vannda", balance: 300);
  BankAccount acc3 = BankAccount(accoutName: "Tena ", balance: 2500);
  acc1.withdrawa(amount: 300);

  Bank myBank = Bank(name: "ABA Bank");
  myBank.addAccount(acc1);
  myBank.addAccount(acc2);
  myBank.addAccount(acc3);
  print(myBank);
}
