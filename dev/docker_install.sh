#!/bin/bash

# 定义一个函数来安装Docker
install_docker() {
    local os_name=$1
    echo "正在安装Docker到$os_name系统..."

    case $os_name in
        "ubuntu"|"debian"|"deepin")
            # 安装Docker到Ubuntu、Debian或Deepin系统
            sudo apt-get update
            sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

            if [[ $os_name == "deepin" ]]; then
                # Deepin发行版直接安装docker.io
                sudo apt-get install -y docker.io
            else
                # 添加Docker的官方GPG密钥
                curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
                # 添加Docker的APT仓库
                sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
                sudo apt-get update
                # 安装最新稳定版本的Docker CE
                sudo apt-get install -y docker-ce
            fi
            ;;
        "centos")
            # 安装Docker到CentOS系统
            # ...（CentOS安装部分与之前相同，此处省略以节省空间）
            ;;
        *)
            echo "不支持的Linux发行版"
            exit 1
            ;;
    esac

    # Docker安装后的配置
    configure_docker
}

# Docker配置函数
configure_docker() {
    # 添加当前用户到docker组
    sudo usermod -aG docker $USER

    # 配置Docker开机启动
    sudo systemctl enable docker

    # 启动Docker服务
    sudo systemctl start docker

    # 验证Docker是否安装成功
    if docker --version &> /dev/null; then
        echo "Docker安装成功，版本：$(docker --version)"
    else
        echo "Docker安装失败"
        exit 1
    fi
}

# 检测Linux发行版
if [ -f /etc/os-release ]; then
    . /etc/os-release
    install_docker $ID
else
    echo "无法检测到Linux发行版"
    exit 1
fi