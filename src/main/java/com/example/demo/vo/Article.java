// Article.java
package com.example.demo.vo;

public class Article {
    private int id;
    private String title;
    private String body;
    private String regDate;
    private String updateDate;
    private int memberId;
    private String extra__writer;
    private String answer;

    // 추가된 필드
    private int boardId;
    private boolean userCanModify;
    private boolean userCanDelete;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    public String getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }

    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        this.memberId = memberId;
    }

    public String getExtra__writer() {
        return extra__writer;
    }

    public void setExtra__writer(String extra__writer) {
        this.extra__writer = extra__writer;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    // boardId 필드의 getter와 setter 추가
    public int getBoardId() {
        return boardId;
    }

    public void setBoardId(int boardId) {
        this.boardId = boardId;
    }

    public boolean isUserCanModify() {
        return userCanModify;
    }

    public void setUserCanModify(boolean userCanModify) {
        this.userCanModify = userCanModify;
    }

    public boolean isUserCanDelete() {
        return userCanDelete;
    }

    public void setUserCanDelete(boolean userCanDelete) {
        this.userCanDelete = userCanDelete;
    }
}
