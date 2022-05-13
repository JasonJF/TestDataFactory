@isTest
public class TestDataFactory {
    
    public static Account createSingleAccount() {
        Account acct = new Account(
        	Name='Test Account'
        );
        
        insert acct;
        return acct;
    }
	public static List<Account> createTestAccounts(Integer number_of_accounts) {
        // List to hold created accounts
        List<Account> accts = new List<Account>();
        for(Integer i = 0; i < number_of_accounts; i++) {
            Account a = new Account(
        	Name='Test Account ' + i
        	);
            accts.add(a);
        }
        
        insert accts;
        //System.debug(accts);
        return accts;
    }
    public static List<Account> createTestAccountWithContacts(Integer number_of_accounts, Integer contacts_per_account) {
        // Set up list to hold accounts and contacts
        List<Account> accts = createTestAccounts(number_of_accounts);
        List<Contact> contacts = new List<Contact>();
        
        for(Account a:accts) {
            Id accountId = a.id;
            for(Integer i = 0; i < contacts_per_account; i++) {
                Contact c = new Contact(
                    FirstName='John '+ i,
                    LastName='from '+ a.Name,
                    AccountId=accountId
                );
                contacts.add(c);
            }
        }
        insert contacts;
        System.debug(contacts);
        return accts;
        
    }
}