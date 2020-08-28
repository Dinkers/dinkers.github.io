---
layout: post
title:  "Restoring an Elastic Beanstalk Database"
description: "Guide for restoring the database from a snapshot."
---

Due to the inflexibility of an EB managed RDS database, restoring an application DB from a snapshot can be difficult. The high level process is to allow EB to create (and manage) a new DB, restore the snapshot independently, dump the snapshot locally and restore the dump into the EB managed DB. 

In practice, the steps to do this are as follows:

* Create VPC security group that gives your IP access to AWS
* Restore old snapshot
* Add VPC security group to snapshot
* Ensure both DBs are publicly accessible (change in RDS config)
* Dump snapshot DB:

```bash
pg_dump -h restored_snapshot_db_identifier.ccjgurhe4rmi.eu-west-2.rds.amazonaws.com -U master -f db_dump.sql ebdb
```

* Ensure new EB DB is up and running
* Add VPC security group to EB DB
* Upload dumped snapshot DB into new EB DB:

```bash
cat db_dump.sql | psql -h eb_db_identifier.ccjgurhe4rmi.eu-west-2.rds.amazonaws.com -U master -d ebdb
```

* Delete snapshot
* Remove VPC security group from EB DB
