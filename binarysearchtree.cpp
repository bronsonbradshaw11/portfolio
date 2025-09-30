#include "binarysearchtree.h"

//@name: BinarySearchTree
//@brief: sets root as a null pointer
//@param: none
//@retval: none

BinarySearchTree::BinarySearchTree() : root(nullptr) {}

//@name: ~BinarySearchTree
//@brief: calls clear function to free memory
//@param: none
//@retval: none

BinarySearchTree::~BinarySearchTree() {
	clear();
}

//@name: insert
//@brief: inserts value into the tree
//@param: value
//@retval: none

void BinarySearchTree::insert(int value) {
	root = insert(root, value);
}

//@name: Node* insert
//@brief: recursively inserts node into correct position
//@param: node, value
//@retval: node

BinarySearchTree::Node* BinarySearchTree::insert(Node* node, int value) {
	
	//adds new node if node doesn't exist
	if (!node) {
		return new Node(value);
	}
	
	//ignores duplicates
	if (value < node->value) {
		node->left = insert(node->left, value);
	} else if (value > node->value) {
		node->right = insert(node->right, value);
	}
	
	return node;
}

//@name: remove
//@brief: removes value from tree
//@param: value
//@retval: none

void BinarySearchTree::remove(int value) {
	root = remove(root, value);
}

//@name: Node* remove
//@brief: recursively removes node with the given value
//@param: node, value
//@retval: node, nullptr, temp

BinarySearchTree::Node* BinarySearchTree::remove(Node* node, int value) {
	//returns nullptr if node doesn't exist
	if (!node) {
		return nullptr;
	}
	
	//handles 3 different cases of no child, one child, or two
	if (value < node->value) {
		node->left = remove(node->left, value);
	} else if (value > node->value) {
		node->right = remove(node->right, value);
	} else {
		if (!node->left && !node->right) {
			delete node;
			return nullptr;
		} else if (!node->left) {
			Node* temp = node->right;
			delete node;
			return temp;
		} else if (!node->right) {
			Node* temp = node->left;
			delete node;
			return temp;
		} 
		//when node has two children use inorder successor for deleting
		else {
			Node* minNode = findMin(node->right);
			node->value = minNode-> value;
			node->right = remove(node->right, minNode->value);
		}
	}
	return node;
}

//@name: findMin
//@brief: helper funciton for remove
//@param: node
//@retval: node

BinarySearchTree::Node* BinarySearchTree::findMin(Node* node) {
	//finds node with smallest value
	while (node->left) {
		node = node-> left;
	}
	return node;
}

//@name: writeInOrder
//@brief: writes sorted contents to a file
//@param: outputFile
//@retval: none

void BinarySearchTree::writeInOrder(std::ofstream& outputFile) {
	//calls inOrderTraversal function
	inOrderTraversal(root, outputFile);
}

//@name: inOrderTraversal
//@brief: outputs values in sorted order
//@param: node, outputFile
//@retval: return

void BinarySearchTree::inOrderTraversal
(Node* node, std::ofstream& outputFile) {
	//writes integer value and base 10 log to 4 decimal places
	if (!node) return;
	inOrderTraversal(node->left, outputFile);
	outputFile << node->value << "\t" << std::fixed << std::setprecision(4) <<
	std::log10(node->value) << "\n";
	inOrderTraversal(node->right, outputFile);
}

//@name: clear
//@brief: deletes all nodes in tree
//@param: none
//@retval: none

void BinarySearchTree::clear() {
	//calls deleteTree function
	deleteTree(root);
	root = nullptr;
}

//@name: deleteTree
//@brief: recursively deletes every node in tree
//@param: node
//@retval: return

void BinarySearchTree::deleteTree(Node* node) {
	//deletes nodes recursively
	if (!node) return;
	deleteTree(node->left);
	deleteTree(node->right);
	delete node;
}