package Services.CommentsServices;

import Models.Comments;
import java.util.ArrayList;
import java.util.List;

public interface CommentServices {
    public List<Comments> getRandomComments();
    public List<Comments> getLastComments();
}
