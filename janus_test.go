package janus

import (
	"testing"
)

func Test_Connect(t *testing.T) {

	client, err := Connect("ws://localhost:8188/")
	//client, err := Connect("wss://janus.cojam.shop:8189/")
	if err != nil {
		t.Fail()
		return
	}
	mess, err := client.Info()
	if err != nil {
		t.Fail()
		return
	}
	t.Log(mess)

	sess, err := client.Create()
	if err != nil {
		t.Fail()
		return
	}
	t.Log(sess)
	t.Log("connect")
}
