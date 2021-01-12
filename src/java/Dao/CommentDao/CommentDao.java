package Dao.CommentDao;

import Models.Comments;
import java.util.ArrayList;
import java.util.List;

public interface CommentDao {
    public List<Comments> getRandomComments();
    
}
