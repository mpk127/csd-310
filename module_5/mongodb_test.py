from pymongo import MongoClient
url = "mongodb+srv://admin:admin@cluster0.bfnee.mongodb.net/pytech?retryWrites=true&w=majority"
client = MongoClient(url)
db = client.pytech
print(" -- Pytech Collection List --")
print(db.list_collection_names())
print()
print("   End of program, press any key to exit...")
