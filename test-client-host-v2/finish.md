I hope this clears up a lot of the confusion about why the Hive connector is 
called as such and what it means for Trino to replace the Hive runtime. 

In short, if you have existing data that is managed by a Hive metastore, the
data and metadata can remain as it is. You can simply point Trino to the
Hive metastore and storage instance and begin running blazingly fast analytics
queries over your data without using any Hive services other than the metastore.
