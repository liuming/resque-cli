require_relative "cli/version"
require 'thor'
require 'resque'

module Resque
  module Cli
    class Queue < ::Thor
      desc "list", "list all queues"
      def list
        puts ::Resque.queues
      end

      desc "remove", "remove a queue"
      def remove(queue_name)
        puts ::Resque.remove_queue(queue_name)
      end

      desc "peek", "peek into a queue"
      def peek(queue_name, start = 0, count = 1)
        puts ::Resque.peek(queue_name, start, count)
      end

      desc "size", "size of a queue"
      def size(queue_name)
        puts ::Resque.size(queue_name)
      end
    end

    class Worker < ::Thor
      desc "list", "list all workers"
      def list
        puts ::Resque.workers
      end

      desc "working", "list all working workers"
      def working
        puts ::Resque.working
      end

      desc "remove", "remove a worker"
      def remove(worker_id)
        puts ::Resque.remove_worker(worker_id)
      end

    end

    class Commander < ::Thor
      desc "info", "resque runtime info"
      def info
        puts ::Resque.info
      end

      desc "queue", "queue commands"
      subcommand 'queue', Queue

      desc "worker", "worker commands"
      subcommand 'worker', Worker
    end
  end
end
