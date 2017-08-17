package com.yoparty.bean;

public class Area {
    private String id;

    private String name;

    private String parentId;
    private String parent_key = "0";
    private String dict_key = "0";
    private int dict_level;
    private String root_key = "AREA";

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId == null ? null : parentId.trim();
    }

    public String getParent_key() {
        return parent_key;
    }

    public void setParent_key(String parent_key) {
        this.parent_key = parent_key;
    }

    public String getDict_key() {
        return dict_key;
    }

    public void setDict_key(String dict_key) {
        this.dict_key = dict_key;
    }

    public int getDict_level() {
        return dict_level;
    }

    public void setDict_level(int dict_level) {
        this.dict_level = dict_level;
    }

    public String getRoot_key() {
        return root_key;
    }

    public void setRoot_key(String root_key) {
        this.root_key = root_key;
    }
}