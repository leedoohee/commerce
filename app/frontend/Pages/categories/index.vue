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
import { TabulatorFull as Tabulator } from "tabulator-tables"; //import Tabulator library
import "tabulator-tables/dist/css/tabulator_semanticui.css";
export default {
  data() {
    return {
      tabulator: null, //variable to hold your table
      tableDataNested: [
        {
          name: "Oli Bob",
          location: "United Kingdom",
          gender: "male",
          col: "red",
          dob: "14/04/1984",
          _children: [
            {
              name: "Mary May",
              location: "Germany",
              gender: "female",
              col: "blue",
              dob: "14/05/1982",
            },
            {
              name: "Christine Lobowski",
              location: "France",
              gender: "female",
              col: "green",
              dob: "22/05/1982",
            },
            {
              name: "Brendon Philips",
              location: "USA",
              gender: "male",
              col: "orange",
              dob: "01/08/1980",
              _children: [
                {
                  name: "Margret Marmajuke",
                  location: "Canada",
                  gender: "female",
                  col: "yellow",
                  dob: "31/01/1999",
                },
                {
                  name: "Frank Harbours",
                  location: "Russia",
                  gender: "male",
                  col: "red",
                  dob: "12/05/1966",
                },
              ],
            },
          ],
        },
        {
          name: "Jamie Newhart",
          location: "India",
          gender: "male",
          col: "green",
          dob: "14/05/1985",
        },
        {
          name: "Gemma Jane",
          location: "China",
          gender: "female",
          col: "red",
          dob: "22/05/1982",
          _children: [
            {
              name: "Emily Sykes",
              location: "South Korea",
              gender: "female",
              col: "maroon",
              dob: "11/11/1970",
            },
          ],
        },
        {
          name: "James Newman",
          location: "Japan",
          gender: "male",
          col: "red",
          dob: "22/03/1998",
        },
      ],
    };
  },
  mounted() {
    //instantiate Tabulator when element is mounted
    this.tabulator = new Tabulator(this.$refs.table, {
      height: 500, // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
      data: this.tableDataNested,
      dataTree: true,
      dataTreeStartExpanded: true,
      layout: "fitColumns", //fit columns to width of table (optional)
      pagination: true, //enable pagination
      paginationMode: "remote", //enable remote pagination
      ajaxURL: "", //set url for ajax request
      dataReceiveParams: {
        last_page: "max_pages", //change last_page parameter name to "max_pages"
      },
      columns: [
        { title: "Name", field: "name", width: 200, responsive: 0 }, //never hide this column
        { title: "Location", field: "location", width: 150 },
        { title: "Gender", field: "gender", width: 150, responsive: 2 }, //hide this column first
        { title: "Favourite Color", field: "col", width: 150 },
        {
          title: "Date Of Birth",
          field: "dob",
          hozAlign: "center",
          sorter: "date",
          width: 150,
        },
      ],
    });
  },
  methods: {
    openCategory() {
      window.open(
        "/categories/show",
        "_blank",
        "width=1100, height=360, top=100, left=100, location=no, toolbar=no, menubar=no, status=no, scrollbars=no, resizable=no, fullscreen=no",
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
