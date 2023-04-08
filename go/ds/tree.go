package ds

import "log"

type Tree struct {
	node *TreeNode
}

type TreeNode struct {
	value int
	left  *TreeNode
	right *TreeNode
}

func (t *Tree) GetNode() *TreeNode {
	return t.node
}

func (n *TreeNode) Exists(value int) bool {
	if n == nil {
		return false
	}

	if n.value == value {
		return true
	}

	if value <= n.value {
		return n.left.Exists(value)
	} else {
		return n.right.Exists(value)
	}
}

func (t *Tree) Insert(value int) *Tree {
	if t.node == nil {
		t.node = &TreeNode{value: value}
	} else {
		t.node.insert(value)
	}

	return t
}

func (n *TreeNode) insert(value int) {
	if value <= n.value { // left
		if n.left == nil {
			n.left = &TreeNode{value: value}
		} else {
			n.left.insert(value)
		}
	} else { // right
		if n.right == nil {
			n.right = &TreeNode{value: value}
		} else {
			n.right.insert(value)
		}
	}
}

func PrintNode(n *TreeNode) {
	if n == nil {
		return
	}

	log.Println(n.value)
	PrintNode(n.left)
	PrintNode(n.right)
}
