<template>
  <v-container class="fluid grid-list-xl" fluid>
    <div class="align-center">
      <v-icon icon="mdi-list-box-outline"></v-icon> &nbsp;
      <span style="font-size: large; align-items: center; font-weight: bold"
        >카테고리 관리</span
      >
    </div>
    <div>
      <div class="float-left"></div>
      <div class="float-right">
        <v-btn><v-icon icon="mdi-reload"></v-icon></v-btn>
        <v-btn><v-icon icon="mdi-magnify"></v-icon></v-btn>
        <v-btn @click="openCategory"
          ><v-icon icon="mdi-plus-box-outline"></v-icon
        ></v-btn>
      </div>
    </div>
    <br />
    <br />
    <v-row style="height: 70px">
      <v-col class="d-flex" cols="12" sm="4">
        <v-text-field
          v-model="code"
          hide-details
          label="코드"
          variant="outlined"
          density="compact"
          color="green-accent-1"
        >
        </v-text-field>
      </v-col>

      <v-col class="d-flex" cols="12" sm="4">
        <v-text-field
          v-model="name"
          hide-details
          label="카테고리명"
          variant="outlined"
          density="compact"
          color="green-accent-1"
        >
        </v-text-field>
      </v-col>

      <v-col class="d-flex" cols="12" sm="4">
        <v-radio-group v-model="use_yn" inline hide-details>
          <v-radio
            label="전체"
            value=""
            color="green-accent-1"
          ></v-radio>
          <v-radio
            label="사용"
            value="Y"
            color="green-accent-1"
          ></v-radio>
          <v-radio
            label="미사용"
            value="N"
            color="green-accent-1"
          ></v-radio>
        </v-radio-group>
      </v-col>
    </v-row>
    <v-row>
      <v-spacer></v-spacer>
      <v-spacer></v-spacer>
      <v-divider></v-divider>
    </v-row>
    <v-row>
      <div ref="table"></div>
    </v-row>
  </v-container>
</template>
<script>
import { defineProps } from "vue";
import { TabulatorFull as Tabulator } from "tabulator-tables"; //import Tabulator library
import "tabulator-tables/dist/css/tabulator_semanticui.css";
import axios from "axios";

export default {
  data() {
    return {
      tabulator: null, //variable to hold your table
      categories: null,
      code: "",
      name: "",
      use_yn: "",
      columns: [
        { title: "코드", field: "category_id", width: 200, responsive: 0 }, //never hide this column
        { title: "카테고리명", field: "name", width: 150 },
        { title: "사용여부", field: "use_yn", width: 150 },
        { title: "생성자", field: "register_id", width: 150 },
        { title: "생성일시", field: "create_at", width: 250 },
        { title: "수정자", field: "updater_id", width: 150 },
        { title: "수정일시", field: "update_at", width: 250 },
      ],
    };
  },
  mounted() {
    this.tabulator = new Tabulator(this.$refs.table, {
      height: 500,
      dataTree: true,
      dataTreeStartExpanded: true,
      ajaxURL: "/categories-search",
      //ajaxParams : {key : value, key2:value2}, //파라미터 데이터
      layout: "fitColumns",
      pagination: true,
      ajaxResponse: function (url, params, response) {
        return response;
      },
      columns: this.columns,
    });

    //this.searchCategories();
  },
  methods: {
    openCategory() {
      window.open(
        "/categories/new",
        "_blank",
        "width=1100, height=370, top=100, left=100, location=no, toolbar=no, menubar=no, status=no, scrollbars=no, resizable=no, fullscreen=no",
      );
    },
    searchCategories() {
      axios.get("/categories-search").then((response) => {
        this.categories = response.data;
        this.tabulator.setData(this.categories);
      });
    },
  },
};
</script>

<style lang="scss">
.select-box {
  height: 20px;
  width: 120px;
}
</style>
