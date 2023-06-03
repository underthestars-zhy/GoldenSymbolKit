import XCTest
@testable import GoldenSymbolKit

final class GoldenSymbolKitTests: XCTestCase {
    let svg = """
<svg xmlns="http://www.w3.org/2000/svg" width="220" height="300" viewBox="0 0 220 300">
    <path fill-rule="evenodd"
          d="M166,277.428571 C177.045695,277.428571 186,286.382876 186,297.428571 L186,386 C186,397.045695 177.045695,406 166,406 C154.954305,406 146,397.045695 146,386 L146,297.428571 C146,286.382876 154.954305,277.428571 166,277.428571 Z M256,191.714286 C267.045695,191.714286 276,200.668591 276,211.714286 L276,386 C276,397.045695 267.045695,406 256,406 C244.954305,406 236,397.045695 236,386 L236,211.714286 C236,200.668591 244.954305,191.714286 256,191.714286 Z M346,106 C357.045695,106 366,114.954305 366,126 L366,386 C366,397.045695 357.045695,406 346,406 C334.954305,406 326,397.045695 326,386 L326,126 C326,114.954305 334.954305,106 346,106 Z"
          transform="translate(-146 -106)"/>
</svg>
"""
    func testFindPath() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        print(try GoldenSymbolKit().findSVGPath(in: svg) ?? "No Res")
    }

    func testFindPathDrawCommands() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let path = try GoldenSymbolKit().findSVGPath(in: svg)!
        print(try path.drawCommands())
    }

    func testTurnBezierPath() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let path = try GoldenSymbolKit().findSVGPath(in: svg)!
        let bezierPath = try path.toNSBezierPath()
        print(bezierPath.bounds.center)
        print(bezierPath.bounds.size)
    }

    func testCreateModifiedString() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let path = try GoldenSymbolKit().findSVGPath(in: svg)!
        let new = try path.modifie(by: [.rotate(degree: 90)])
        print(new)
    }

    func testCreateSimpleModifiedString() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let path = try GoldenSymbolKit().findSVGPath(in: svg)!
        let new = try path.modifie(translation: (dx: 1200, dy: 1200), rotation: 0, scale: 2)
        print(new)
    }
}
