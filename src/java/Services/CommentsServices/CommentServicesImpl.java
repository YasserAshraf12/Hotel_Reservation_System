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

    @Override
    public List<Comments> getLastComments() {
        return commentDao.getLastComments();
    }

    @Override
    public boolean deleteComment(Integer id) {
        return commentDao.deleteComment(id);
    }
    
    
    
}
