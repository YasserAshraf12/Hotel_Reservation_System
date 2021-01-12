package Services.CommentsServices;

import Dao.CommentDao.CommentDao;
import Dao.CommentDao.CommentDaoImpl;
import Models.Comments;
import java.util.ArrayList;
import java.util.List;

public class CommentServicesImpl implements CommentServices{

    CommentDao commentDao = new CommentDaoImpl();
    @Override
    public List<Comments> getRandomComments() {
        return commentDao.getRandomComments();
    }
    
}
