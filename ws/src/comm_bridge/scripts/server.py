#!/usr/bin/env python
# coding=utf-8
import rospy
from comm_bridge.srv import *
from std_msgs.msg import *
from geometry_msgs.msg import *

import logging.config

from wsgiref.simple_server import make_server
from ws4py.server.wsgirefserver import WSGIServer, WebSocketWSGIRequestHandler
from ws4py.server.wsgiutils import WebSocketWSGIApplication

from wshubsapi.connection_handlers.ws4py_handler import ConnectionHandler

from wshubsapi import asynchronous
from wshubsapi.hubs_inspector import HubsInspector
from wshubsapi.hub import Hub

logging.basicConfig(level=logging.DEBUG)
log = logging.getLogger("ros")
logging.getLogger('root').setLevel(logging.DEBUG)

server = make_server('', 8889, server_class=WSGIServer,
                     handler_class=WebSocketWSGIRequestHandler,
                     app=WebSocketWSGIApplication(handler_cls=ConnectionHandler))
server.initialize_websockets_manager()


class TopicsManager(Hub):
    def __init__(self):
        super(TopicsManager, self).__init__()
        self.publisher = None
        ''':type : rospy.Publisher'''
        self.mobile_action_publisher = None
        ''':type : rospy.Publisher'''

    def publish(self, message, *args, **kwargs):
        hello_str = "hello world %s" % rospy.get_time()
        rospy.loginfo(hello_str)
        self.publisher.publish(message)

    def service(self, req):
        if self._is_mobile_connected():
            client = self.clients.get('mobile')
            if req.sensor == "acc":
                acc = client.get_acc().result(timeout=5)
            elif req.sensor == "orientation":
                acc = client.get_acc().result(timeout=5)
            return dict(respond=[acc["x"], acc["y"], acc["z"]])

    def publish_mobile_action(self, action):
        self.mobile_action_publisher.publish(action)

    def show_toast(self, message):
        client = self.clients.get('mobile')
        client.show_toast(message.data)

    @staticmethod
    def static_func():
        pass

    def _is_mobile_connected(self):
        return 'mobile' in self.clients.all_connected_clients

    def _define_client_functions(self):
        """
        This function will tell the client possible client functions to be called from sever
        It is just to inform, it is not mandatory but recommended
        """
        return dict(get_acc=lambda: None,
                    get_gyr=lambda: None,
                    get_mag=lambda: None,
                    show_toast=lambda message: None)


@asynchronous.asynchronous()
def init_server():
    # todo remove next line when server is tested
    HubsInspector.construct_js_file("/home/startic/repos/botbloq-app/app/www/js/libs/hubsApi.js")
    # HubsInspector.construct_python_file(settings["static_path"])
    log.debug("starting...")
    server.serve_forever()


def talker():
    hub = TopicsManager.get_instance()
    ''' :type : TopicsManager'''

    pub = rospy.Publisher('mobile_show_toast', String, queue_size=10)
    hub.mobile_action_publisher = rospy.Publisher('mobile_action', String, queue_size=10)
    rospy.Service('get_sensor', GetSensor, hub.service)
    hub.publisher = pub


def listener():
    hub = TopicsManager.get_instance()
    ''' :type : TopicsManager'''
    rospy.Subscriber("mobile_show_toast", String, hub.show_toast)


if __name__ == '__main__':
    rospy.init_node('ws_bridge', anonymous=True)
    HubsInspector.inspect_implemented_hubs()
    init_server()
    talker()
    listener()
    rospy.spin()
