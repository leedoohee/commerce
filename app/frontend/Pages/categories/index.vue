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
      <v-col class="d-flex align-center" cols="12" sm="6">
        <v-select
          label="업체"
          density="compact"
          :items="[
            'California',
            'Colorado',
            'Florida',
            'Georgia',
            'Texas',
            'Wyoming',
          ]"
          variant="outlined"
          color="green-accent-1"
        >
        </v-select>
      </v-col>

      <v-col class="d-flex" cols="12" sm="6">
        <v-select
          label="상품구분"
          density="compact"
          :items="[
            'California',
            'Colorado',
            'Florida',
            'Georgia',
            'Texas',
            'Wyoming',
          ]"
          variant="outlined"
          color="green-accent-1"
        >
        </v-select>
      </v-col>
    </v-row>
    <v-row>
      <v-col class="d-flex align-center" cols="12" sm="6">
        <v-select
          label="상품상태"
          density="compact"
          :items="[
            'California',
            'Colorado',
            'Florida',
            'Georgia',
            'Texas',
            'Wyoming',
          ]"
          variant="outlined"
          color="green-accent-1"
        >
        </v-select>
      </v-col>

      <v-col class="d-flex" cols="12" sm="6">
        <v-select
          label="주문갯수"
          density="compact"
          :items="[
            'California',
            'Colorado',
            'Florida',
            'Georgia',
            'Texas',
            'Wyoming',
          ]"
          variant="outlined"
          color="green-accent-1"
        >
        </v-select>
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
export default {
  props: {
    categories: {
      type: Array,
      required: true,
    },
  },
  data() {
    return {
      tabulator: null, //variable to hold your table
      columns: [
        { title: "코드", field: "category_id", width: 200, responsive: 0 }, //never hide this column
        { title: "카테고리명", field: "name", width: 150 },
        { title: "사용여부", field: "use_yn", width: 150 },
      ],
    };
  },
  mounted() {
    //instantiate Tabulator when element is mounted
    this.tabulator = new Tabulator(this.$refs.table, {
      height: 500, // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
      data: this.categories,
      dataTree: true,
      dataTreeStartExpanded: true,
      layout: "fitColumns", //fit columns to width of table (optional)
      pagination: true, //enable pagination
      paginationMode: "remote", //enable remote pagination
      ajaxURL: "", //set url for ajax request
      dataReceiveParams: {
        last_page: "max_pages", //change last_page parameter name to "max_pages"
      },
      columns: this.columns,
    });
  },
  methods: {
    openCategory() {
      window.open(
        "/categories/new",
        "_blank",
        "width=1100, height=370, top=100, left=100, location=no, toolbar=no, menubar=no, status=no, scrollbars=no, resizable=no, fullscreen=no",
      );
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
