class utility {
  /*
  this class collects all needed tree methods
   */
  String error_1 = "operation not allowed on this node type";
  utility() {
  }

  String set_values(node N) {
    // sets each node value to the formula up to that node
    String v = "";
    switch(N.type) {
    case 0:
      v = N.value;
      break;
    case 1:
      // setting values of children
      if (N.children.get(0).type == 0) {
        v = set_values(N.children.get(0));
      } else {
        v = "(" + set_values(N.children.get(0)) + ")";
      }
      for (int i=1; i<N.children.size(); i++) {
        if (N.children.get(i).type == 0) {
          v = v + "+" +set_values(N.children.get(i));
        } else {
          v = v + "+(" +set_values(N.children.get(i))+")";
        }
      }
      break;
    case 2:
      // setting values of children
      if (N.children.get(0).type == 0) {
        v = set_values(N.children.get(0));
      } else {
        v = "(" + set_values(N.children.get(0)) + ")";
      }
      for (int i=1; i<N.children.size(); i++) {
        if (N.children.get(i).type == 0) {
          v = v + "*" +set_values(N.children.get(i));
        } else {
          v = v + "*(" +set_values(N.children.get(i))+")";
        }
      }
      break;
    }
    return v;
  }

  void add_child(node N, int type, String value) {
    // adds a child to an existing node N
    node new_node = new node(type);
    n_nodes++;
    new_node.ID = n_nodes;
    if (type == 0) {
      // if node type is constant
      new_node.value = value;
    }
    N.children.add(new_node);
  }

  String evaluate(node N) {
    // 
    String formula = "";
    return formula;
  }

  // formula-building methods based on algebraic properties
  void distribute(node N) {
  }
  void factor(node N) {
  }
  void add_zero(node N) {
    /* substitutes a node N of type constant OR type + with a node of type + with two children:
     1) the original node N
     2) a new constant node with value 0
     */
    // check if node type is consistent:
    if (N.type == 0) {
      // node is a constant
      add_child(N, 0, N.value);
      add_child(N, 0, "0");
      // node updates from constant to operator
      N.type = 1;
      N.value = "+";
    } else if (N.type == 1) {
      // node is type +
      // just adding a constant child 
      add_child(N, 0, "0");
    } else {
      println(error_1);
    }
  }

  void times_one(node N) {
    /* substitutes a node N of type constant OR type * with a node of type * with two children:
     1) the original node N
     2) a new constant node with value 1
     */
    // check if node type is consistent:
    if (N.type == 0) {
      // node is a constant
      add_child(N, 0, N.value);
      add_child(N, 0, "1");
      // node updates from constant to operator
      N.type = 2;
      N.value = "*";
    } else if (N.type == 2) {
      // node is type * 
      // just adding a constant child 
      add_child(N, 0, "1");
    } else {
      println(error_1);
    }
  }
}