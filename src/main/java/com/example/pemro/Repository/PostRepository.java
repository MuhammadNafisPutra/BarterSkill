package com.example.pemro.Repository;

import com.example.pemro.model.Postingan;

import java.util.List;

public class PostRepository implements PostRepositoryInterface {
    @Override
    public boolean savePost(Postingan post) {
        return false;
    }

    @Override
    public List<Postingan> loadAllPosts() {
        return List.of();
    }

    @Override
    public boolean deletePost(int postId) {
        return false;
    }

    @Override
    public boolean updatePost(Postingan post) {
        return false;
    }

    @Override
    public List<Postingan> searchPosts(String keyword) {
        return List.of();
    }
}
