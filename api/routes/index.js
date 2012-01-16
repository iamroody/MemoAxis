
/*
 * GET home page.
 */
var mongo = require('mongoskin'),
    collection = mongo.db('localhost:27017/test_db').collection('feeds');

exports.index = function(req, res){
  collection.find().toArray(function(err, feeds) {
    res.send(feeds);
  });
};
