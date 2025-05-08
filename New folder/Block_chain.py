import hashlib
import time
import random

class Block:
    def __init__(self, index, previous_hash, timestamp, data, hash):
        self.index = index
        self.previous_hash = previous_hash
        self.timestamp = timestamp
        self.data = data
        self.hash = hash

    def __repr__(self):
        return f"Block({self.index}, {self.previous_hash}, {self.timestamp}, {self.data}, {self.hash})"

class Blockchain:
    def __init__(self):
        self.chain = []
        self.create_genesis_block()

    def create_genesis_block(self):
        genesis_block = Block(0, "0", time.time(), "Genesis Block", self.calculate_hash(0, "0", time.time(), "Genesis Block"))
        self.chain.append(genesis_block)

    def add_block(self, data):
        last_block = self.chain[-1]
        index = last_block.index + 1
        timestamp = time.time()
        previous_hash = last_block.hash
        hash = self.calculate_hash(index, previous_hash, timestamp, data)
        block = Block(index, previous_hash, timestamp, data, hash)
        self.chain.append(block)
        return block

    def calculate_hash(self, index, previous_hash, timestamp, data):
        block_string = f"{index}{previous_hash}{timestamp}{data}"
        return hashlib.sha256(block_string.encode('utf-8')).hexdigest()

    def print_chain(self):
        for block in self.chain:
            print(block)

# Simulating adding blocks to the chain
blockchain = Blockchain()
for i in range(1, 6):
    blockchain.add_block(f"Block #{i} Data: Transaction {random.randint(1, 100)}")
    time.sleep(random.randint(1, 3))

blockchain.print_chain()
