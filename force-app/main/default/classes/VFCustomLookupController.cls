public inherited sharing class VFCustomLookupController {
    
    public List<sObject> sObjectsToDisplay {get; set;}
    public String sObjectName {get; set;}
    public String lookupInput {get; set;}

    public static List<sObject> findRecords(String searchKey, String objectName) {          
      string searchText = '\'' + String.escapeSingleQuotes(searchKey) + '%\'';  
      string query = 'SELECT Id, Name FROM ' +objectName+ ' WHERE Name LIKE '+searchText+' LIMIT 20';  
      return Database.query('SELECT Id, Name FROM ' +objectName+ ' WHERE Name LIKE '+searchText+' LIMIT 20');  
    }  

    public void updateLookupResult(){
      String searchValue = Apexpages.currentPage().getParameters().get('searchValue');
      lookupInput = searchValue;
      if(searchValue == ''){
        if(sObjectsToDisplay != null){
          sObjectsToDisplay.clear();
        }
        return;
      }
      sObjectsToDisplay = findRecords(searchValue, sObjectName);
      return;
    }

    public VFCustomLookupController() {
       lookupInput = '';
    }
}
