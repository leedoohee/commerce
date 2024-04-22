<template>
  <v-container class="fluid grid-list-xl" fluid>
    <div class="align-center">
      <v-icon icon="mdi-list-box-outline"></v-icon> &nbsp;
      <span style="font-size: large; align-items: center; font-weight: bold"
        >주문관리</span
      >
    </div>
    <div>
      <div class="float-left"></div>
      <div class="float-right">
        <v-btn><v-icon icon="mdi-reload"></v-icon></v-btn>
        <v-btn><v-icon icon="mdi-magnify"></v-icon></v-btn>
        <v-btn @click="openProduct"
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
      tableData: [
        {
          order_id: "1",
          order_state: "주문완료",
          order_date: "2024-04-21",
          order_name: "이두희",
          order_quantity: "1",
          order_price: "100,000",
          order_product: "상품1",
          order_phone: "010-1234-5678",
          order_memo: "메모1",
        },
        {
          order_id: "2",
          order_state: "주문완료",
          order_date: "2024-04-21",
          order_name: "이두희",
          order_quantity: "1",
          order_price: "100,000",
          order_product: "상품2",
          order_phone: "010-1234-5678",
          order_memo: "메모2",
        },
        {
          order_id: "3",
          order_state: "주문완료",
          order_date: "2024-04-21",
          order_name: "이두희",
          order_quantity: "1",
          order_price: "100,000",
          order_product: "상품3",
          order_phone: "010-1234-5678",
          order_memo: "메모3",
        },
        {
          order_id: "4",
          order_state: "주문완료",
          order_date: "2024-04-21",
          order_name: "이두희",
          order_quantity: "1",
          order_price: "100,000",
          order_product: "상품4",
          order_phone: "010-1234-5678",
          order_memo: "메모4",
        },
        {
          order_id: "5",
          order_state: "주문완료",
          order_date: "2024-04-21",
          order_name: "이두희",
          order_quantity: "1",
          order_price: "100,000",
          order_product: "상품5",
          order_phone: "010-1234-5678",
          order_memo: "메모5",
        }
      ], //data for table to display
    };
  },
  mounted() {
    //instantiate Tabulator when element is mounted
    this.tabulator = new Tabulator(this.$refs.table, {
      height: 500, // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
      data: this.tableData, //assign data to table
      layout: "fitColumns", //fit columns to width of table (optional)
      pagination: true, //enable pagination
      paginationMode: "remote", //enable remote pagination
      ajaxURL: "", //set url for ajax request
      dataReceiveParams: {
        last_page: "max_pages", //change last_page parameter name to "max_pages"
      },
      columns: [
        //Define Table Columns
        { title: "주문번호", field: "order_id", cellClick: this.openOrder},
        { title: "주문상태", field: "order_state" },
        { title: "주문일자", field: "order_date" },
        { title: "주문자", field: "order_name" },
        { title: "주문수량", field: "order_quantity" },
        { title: "주문금액", field: "order_price" },
        { title: "주문상품", field: "order_product" },
        { title: "주문연락처", field: "order_phone" },
        { title: "주문메모", field: "order_memo" },
      ],
    });
  },
  methods: {
    openProduct() {
      window.open(
        "/products/show",
        "_blank",
        "width=1100, height=800, top=100, left=100, location=no, toolbar=no, menubar=no, status=no, scrollbars=no, resizable=no, fullscreen=no",
      );
    },
    openOrder(cell, formatterParams, onRendered) {
      //return `<a href="/orders/show/${cell.getValue()}" class="inertia-link">${cell.getValue()}</a>`;
      window.open(
        "/orders/show",
        "_blank",
        "width=1100, height=800, top=100, left=100, location=no, toolbar=no, menubar=no, status=no, scrollbars=no, resizable=no, fullscreen=no",
      );
    }
  },
};
</script>

<style lang="scss">
.select-box {
  height: 20px;
  width: 120px;
}
.inertia-link {
  color: #000000;
  text-decoration-line: none;
}
</style>
