import matplotlib.pyplot as plt
import networkx as nx
import hashlib
import random
import time

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
        genesis_block = Block(0, "0", 0, "Genesis Block", self.calculate_hash(0, "0", 0, "Genesis Block"))
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

    def create_graph(self):
        G = nx.DiGraph()  # Directed graph (since blockchain is directional)
        
        # Adding nodes and edges based on the blockchain
        for block in self.chain:
            G.add_node(block.index, label=f"Block {block.index}")
            if block.index > 0:
                G.add_edge(block.index - 1, block.index)
        
        return G

    def print_chain(self):
        for block in self.chain:
            print(block)

    def visualize_graph(self):
        # Create the graph from the blockchain
        G = self.create_graph()

        # Draw the graph
        pos = nx.spring_layout(G, seed=42)  # Position nodes using a spring layout
        nx.draw(G, pos, with_labels=True, node_size=2000, node_color="lightblue", font_size=10, font_weight="bold", arrows=True)

        labels = nx.get_node_attributes(G, 'label')
        nx.draw_networkx_labels(G, pos, labels=labels, font_size=12, font_weight="bold")
        
        # Show the graph
        plt.title("Blockchain Visualization")
        plt.show()

# Simulating blockchain creation and adding blocks
blockchain = Blockchain()
for i in range(1, 6):
    blockchain.add_block(f"Block #{i} Data: Transaction {random.randint(1, 100)}")
    time.sleep(random.randint(1, 3))

blockchain.print_chain()

# Visualize the blockchain graph
blockchain.visualize_graph()
