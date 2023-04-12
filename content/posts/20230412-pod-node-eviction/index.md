---
title: "Pod & Node Eviction"
description: "What is Pod and Node Eviction in Kubernetes?"
summary: "What is Pod and Node Eviction in Kubernetes?"
categories: []
tags: ["tech", "devops", "software", "development", "oss"]
showSummary: true
date: 2023-04-12
showauthor: true
---

In the world of container orchestration, Kubernetes is the de facto standard. It is an open-source platform for automating the deployment, scaling, and management of containerized applications. Kubernetes abstracts the underlying infrastructure and provides a unified API for managing containerized workloads. However, as with any complex system, Kubernetes is not immune to failures. In this article, we will discuss one such failure scenario - Pod and Node eviction in Kubernetes.

## What is Pod and Node Eviction?

Pod and Node eviction are two related concepts in Kubernetes. A Pod is the smallest deployable unit in Kubernetes. It consists of one or more containers that share the same network namespace and storage. A Node is a physical or virtual machine that runs the Kubernetes software and can host one or more Pods.

Pod eviction happens when a Pod is terminated by the Kubernetes system due to some reason, such as a Node failure or resource constraints. Node eviction, on the other hand, happens when a Node is marked un-schedulable and the Pods running on it are evicted to other Nodes.

## Why does Pod and Node Eviction happen?

Pod and Node eviction can happen due to a variety of reasons, such as:

- Node failures - A Node can fail due to hardware or software issues, such as network failure, power outage, or kernel panic.

- Resource constraints - A Node may run out of resources, such as CPU, memory, or disk space, which can cause Pods to be evicted.

- Node maintenance - A Node may be taken down for maintenance, such as kernel upgrades, security patches, or hardware replacement.

- Pod failures - A Pod may fail due to application errors or resource constraints, which can trigger Pod eviction and rescheduling on other Nodes.

## Some Examples of Pod and Node Evictions

- Node failure - Let's say you have a Kubernetes cluster with three Nodes. One of the Nodes experiences a hardware failure, causing it to become un-schedulable. The Kubernetes scheduler identifies the Pods running on the failed Node and reschedules them on the remaining Nodes, marking the failed Node for eviction.
  
- Resource constraints - If a Pod starts consuming too much CPU or memory, it can cause the Node to run out of resources. Kubernetes may then decide to evict the Pod to free up resources for other Pods running on the Node.

- Node maintenance - When you need to perform maintenance on a Node, you can mark it as un-schedulable using the Kubernetes API. Kubernetes then identifies the Pods running on the Node and reschedules them on other Nodes, allowing you to take the Node offline for maintenance.
  
- Pod failures - If a Pod fails due to a crash or error, Kubernetes may decide to evict it and reschedule it on another Node. This helps ensure that the Pod remains available and responsive even in the face of failures.

In all of these scenarios, Kubernetes controllers monitor the state of Nodes and Pods and take appropriate actions to ensure the availability and reliability of your applications

## How do Pod and Node Eviction work?

Pod and Node eviction are handled by Kubernetes controllers, which monitor the state of Nodes and Pods and take actions based on the configured policies. When a Node fails or becomes un-schedulable, the Kubernetes scheduler identifies the Pods running on the Node and selects new Nodes to run them. The Pods are then rescheduled on the new Nodes, and the old Nodes are marked for eviction.

The eviction process involves sending a `SIGTERM` signal to the containers running in the Pod, giving them a grace period to shut down gracefully. If the containers do not stop within the grace period, they are forcibly terminated with a `SIGKILL` signal. Once all the containers are terminated, the Pod is deleted from the Node.

In the case of Node eviction, the Kubernetes system follows a similar process. It first identifies the Pods running on the Node and selects new Nodes to run them. The Pods are then rescheduled on the new Nodes, and the old Node is marked un-schedulable. The Pods running on the old Node are then evicted using the same process as Pod eviction.

## How can we handle Pod and Node Eviction?

Pod and Node eviction is inevitable in a Kubernetes cluster, and it is essential to have a strategy in place to handle them. Here are some best practices to handle Pod and Node eviction:

- Use resource limits - Set resource limits on Pods to prevent them from consuming all the resources on a Node, which can cause other Pods to be evicted.
  
- Use `PodDisruptionBudgets` - Use `PodDisruptionBudgets` to ensure that a minimum number of Pods are available during Pod eviction, which can prevent service disruption.

- Use `NodeAffinity` and anti-affinity - Use `NodeAffinity` and anti-affinity rules to ensure that Pods is scheduled on Nodes that meet certain criteria, such as having enough resources or being in a specific zone.

- Use node maintenance modes - Use node maintenance modes to gracefully drain a Node before evicting the Pods, which can prevent service disruption.

## Summary

Pod and Node eviction is an integral part of Kubernetes, and it is essential to understand how they work and how to handle them. By following the best practices mentioned above, you can ensure that your applications remain available and responsive even in the face of Pod and Node eviction.

In conclusion, Pod and Node eviction is a necessary "evil" in a Kubernetes cluster. While they may seem daunting, understanding how they work and taking the necessary precautions can help minimize their impact on your applications. As Kubernetes continues to evolve, we can expect more tools and techniques to emerge to help us manage Pod and Node eviction more effectively.
