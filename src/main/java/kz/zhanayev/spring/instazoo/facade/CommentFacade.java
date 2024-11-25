package kz.zhanayev.spring.instazoo.facade;

import kz.zhanayev.spring.instazoo.dto.CommentDTO;
import kz.zhanayev.spring.instazoo.entity.Comment;
import org.springframework.stereotype.Component;

@Component
public class CommentFacade {

    public CommentDTO commentToCommentDTO(Comment comment) {
        CommentDTO commentDTO = new CommentDTO();
        commentDTO.setId(comment.getId());
        commentDTO.setUsername(comment.getUsername());
        commentDTO.setMessage(comment.getMessage());

        return commentDTO;
    }

}
