require_relative "test_helper"

describe "dijkstra" do
  it "works with a largish complicated matrix" do
    # Arrange
    adjacency_matrix =[ 
      [ 0, 4, 0, 0, 0, 0, 0, 8, 0 ], 
      [ 4, 0, 8, 0, 0, 0, 0, 11, 0 ], 
      [ 0, 8, 0, 7, 0, 4, 0, 0, 2 ], 
      [ 0, 0, 7, 0, 9, 14, 0, 0, 0 ], 
      [ 0, 0, 0, 9, 0, 10, 0, 0, 0 ], 
      [ 0, 0, 4, 14, 10, 0, 2, 0, 0 ], 
      [ 0, 0, 0, 0, 0, 2, 0, 1, 6 ], 
      [ 8, 11, 0, 0, 0, 0, 1, 0, 7 ], 
      [ 0, 0, 2, 0, 0, 0, 6, 7, 0 ] 
    ]

    # Act
    answer = dijkstra(adjacency_matrix, 0)

    expect(answer).must_equal({
        start_node: 0, 
        parent_list: [nil, 0, 1, 2, 5, 6, 7, 0, 2], 
        shortest_distances: [0, 4, 12, 19, 21, 11, 9, 8, 14]
    })
  end

  it "will work for a small graph" do
    # Arrange
    adjacency_matrix =[ 
      [0, 4, 0, 0],
      [4, 0, 12, 6],
      [0, 12, 0, 0],
      [0,  6, 0, 0]
    ]

    # Act
    answer = dijkstra(adjacency_matrix, 0)

    expect(answer).must_equal({
        start_node: 0, 
        parent_list: [nil, 0, 1, 1], 
        shortest_distances: [0, 4, 16, 10]
    })
  end

  it "will work for an unconnected graph" do
    # Arrange
    adjacency_matrix =[ 
      [0, 4, 0, 0],
      [4, 0, 12, 0],
      [0, 12, 0, 0],
      [0,  0, 0, 0]
    ]

    # Act
    answer = dijkstra(adjacency_matrix, 0)

    expect(answer).must_equal({
        start_node: 0, 
        parent_list: [nil, 0, 1, nil], 
        shortest_distances: [0, 4, 16, Float::INFINITY]
    })
  end

  it "will work for an starting nodes other than 0" do
    # Arrange
    adjacency_matrix =[ 
      [0, 4, 0, 0],
      [4, 0, 12, 0],
      [0, 12, 0, 0],
      [0,  0, 0, 0]
    ]

    # Act
    answer = dijkstra(adjacency_matrix, 2)

    expect(answer).must_equal({
        start_node: 2, 
        parent_list: [1, 2, nil, nil], 
        shortest_distances: [16, 12, 0, Float::INFINITY]
    })
  end

  it "will report no connections starting at an unconnected node" do
    # Arrange
    adjacency_matrix =[ 
      [0, 4, 0, 0],
      [4, 0, 12, 0],
      [0, 12, 0, 0],
      [0,  0, 0, 0]
    ]

    # Act
    answer = dijkstra(adjacency_matrix, 3)

    expect(answer).must_equal({
        start_node: 3, 
        parent_list: [nil, nil, nil, nil], 
        shortest_distances: [Float::INFINITY, Float::INFINITY, Float::INFINITY, 0]
    })
  end
end