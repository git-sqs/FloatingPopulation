<template>
  <div class="loginAll">
    <div class="loginCenter">
      <el-form class="loginForm">
        <el-form-item style="margin-bottom: 2rem;">
          <span style="font-size: 1.6rem">城市流动人口管理系统</span>
        </el-form-item>
        <el-form-item>
          <el-row>
            <el-col :span="3">
              <span>账户：</span>
            </el-col>
            <el-col :span="21">
              <el-input placeholder="请输入账户"></el-input>
            </el-col>
          </el-row>
        </el-form-item>
        <el-form-item>
          <el-row>
            <el-col :span="3">
              <span>密码：</span>
            </el-col>
            <el-col :span="21">
              <el-input placeholder="请输入密码"></el-input>
            </el-col>
          </el-row>
        </el-form-item>
        <el-form-item style="margin-left: 6rem;margin-top: 2rem">
          <el-button type="primary">立即创建</el-button>
          <el-button>重置</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
    export default {
        name: "login"
    }
</script>

<style scoped>
  .loginAll {

  }

  .loginCenter {
    margin-top: 10rem;
    margin-left: 32rem;
    height: 20rem;
    width: 30rem;
    background-color: darkgray;
  }

  .loginForm {
    padding: 2rem;
  }
</style>
