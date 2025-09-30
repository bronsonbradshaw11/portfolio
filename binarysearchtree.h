#ifndef BINARYSEARCHTREE_H
#define BINARYSEARCHTREE_H

#include <iostream>
#include <fstream>
#include <cmath>
#include <iomanip>

class BinarySearchTree {
	private:
		struct Node {
			int value;
			Node* left;
			Node* right;
			Node(int val) : value(val), left(nullptr), right(nullptr) {}
		};
		
		Node* root;
		
		Node* insert(Node* node, int value);
		Node* remove(Node* node, int value);
		Node* findMin(Node* node);
		void inOrderTraversal(Node* node, std::ofstream& outputFile);
		void deleteTree(Node* node);
		
	public:
		BinarySearchTree();
		~BinarySearchTree();
		
		void insert(int value);
		void remove(int value);
		void writeInOrder(std::ofstream& outputFile);
		void clear();
};


#endif