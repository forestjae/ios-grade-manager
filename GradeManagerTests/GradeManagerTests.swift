//
//  GradeManagerTests.swift
//  GradeManagerTests
//
//  Created by kakao on 2022/12/27.
//

import XCTest

final class GradeManagerTests: XCTestCase {
    let sut: GradeManager = GradeManager()
    
    func test_잘못된메뉴선택() {
        //given
        let input = "6"

        //when
        let result = sut.menu(command: input)
        
        //then
        XCTAssertEqual(result, nil)
    }
    
    func test_중복_학생_입력_시_오류() {
        //given
        let input = "dupStudent"
        
        //when
        sut.addStudent(of: input)
        
        //then
        let result = sut.isExisting(name: input)
        XCTAssertEqual(result, true)
    }
    
    func test_미중복_학생_입력_시_통과() {
        //given
        let input = "Student"
        let currentStudentCount = sut.students.count
        
        //when
        sut.addStudent(of: input)
        
        //then
        let result = sut.students.count
        XCTAssertEqual(result, currentStudentCount + 1)
    }
    
    func test_학생_삭제_시_학생수_감소() {
        //given
        let input1 = "Forest"
        let input2 = "John"
        sut.addStudent(of: input1)
        sut.addStudent(of: input2)
        let currentStudentCount = sut.students.count
        
        //when
        sut.deleteStudent(of: "Forest")
        
        //then
        let result = sut.students.count
        XCTAssertEqual(result, currentStudentCount - 1)
    }
    
    func test_학생_삭제_실패시_학생수_유지() {
        //given
        let input1 = "Forest"
        let input2 = "John"
        sut.addStudent(of: input1)
        sut.addStudent(of: input2)
        let currentStudentCount = sut.students.count
        
        //when
        sut.deleteStudent(of: "Volga")
        
        //then
        let result = sut.students.count
        XCTAssertEqual(result, currentStudentCount)
    }
}
