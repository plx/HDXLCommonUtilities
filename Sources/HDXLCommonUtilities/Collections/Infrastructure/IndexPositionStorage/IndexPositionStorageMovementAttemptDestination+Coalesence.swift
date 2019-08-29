//
//  IndexPositionStorageMovementAttemptDestination+Coalesence.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Arity-2
// -------------------------------------------------------------------------- //

@inlinable
internal func coalesceMovementAttemptDestinations<Position:AlgebraicProduct2>(
  _ a: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.A>,
  _ b: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.B>) -> IndexPositionStorageMovementAttemptDestination<Position> {
  switch a() {
  case .misnavigation:
    return .misnavigation
  case .becameEnd:
    return .becameEnd
  case .success(let aPosition):
    switch b() {
    case .misnavigation:
      return .misnavigation
    case .becameEnd:
      return .becameEnd
    case .success(let bPosition):
      return .success(
        Position(
          aPosition,
          bPosition
        )
      )
    }
  }
}

// -------------------------------------------------------------------------- //
// MARK: Arity-3
// -------------------------------------------------------------------------- //

@inlinable
internal func coalesceMovementAttemptDestinations<Position:AlgebraicProduct3>(
  _ a: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.A>,
  _ b: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.B>,
  _ c: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.C>) -> IndexPositionStorageMovementAttemptDestination<Position> {
  switch a() {
  case .misnavigation:
    return .misnavigation
  case .becameEnd:
    return .becameEnd
  case .success(let aPosition):
    switch b() {
    case .misnavigation:
      return .misnavigation
    case .becameEnd:
      return .becameEnd
    case .success(let bPosition):
      switch c() {
      case .misnavigation:
        return .misnavigation
      case .becameEnd:
        return .becameEnd
      case .success(let cPosition):
        return .success(
          Position(
            aPosition,
            bPosition,
            cPosition
          )
        )
      }
    }
  }
}

// -------------------------------------------------------------------------- //
// MARK: Arity-4
// -------------------------------------------------------------------------- //

@inlinable
internal func coalesceMovementAttemptDestinations<Position:AlgebraicProduct4>(
  _ a: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.A>,
  _ b: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.B>,
  _ c: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.C>,
  _ d: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.D>) -> IndexPositionStorageMovementAttemptDestination<Position> {
  switch a() {
  case .misnavigation:
    return .misnavigation
  case .becameEnd:
    return .becameEnd
  case .success(let aPosition):
    switch b() {
    case .misnavigation:
      return .misnavigation
    case .becameEnd:
      return .becameEnd
    case .success(let bPosition):
      switch c() {
      case .misnavigation:
        return .misnavigation
      case .becameEnd:
        return .becameEnd
      case .success(let cPosition):
        switch d() {
        case .misnavigation:
          return .misnavigation
        case .becameEnd:
          return .becameEnd
        case .success(let dPosition):
          return .success(
            Position(
              aPosition,
              bPosition,
              cPosition,
              dPosition
            )
          )
        }
      }
    }
  }
}

// -------------------------------------------------------------------------- //
// MARK: Arity-5
// -------------------------------------------------------------------------- //

@inlinable
internal func coalesceMovementAttemptDestinations<Position:AlgebraicProduct5>(
  _ a: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.A>,
  _ b: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.B>,
  _ c: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.C>,
  _ d: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.D>,
  _ e: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.E>) -> IndexPositionStorageMovementAttemptDestination<Position> {
  switch a() {
  case .misnavigation:
    return .misnavigation
  case .becameEnd:
    return .becameEnd
  case .success(let aPosition):
    switch b() {
    case .misnavigation:
      return .misnavigation
    case .becameEnd:
      return .becameEnd
    case .success(let bPosition):
      switch c() {
      case .misnavigation:
        return .misnavigation
      case .becameEnd:
        return .becameEnd
      case .success(let cPosition):
        switch d() {
        case .misnavigation:
          return .misnavigation
        case .becameEnd:
          return .becameEnd
        case .success(let dPosition):
          switch e() {
          case .misnavigation:
            return .misnavigation
          case .becameEnd:
            return .becameEnd
          case .success(let ePosition):
            return .success(
              Position(
                aPosition,
                bPosition,
                cPosition,
                dPosition,
                ePosition
              )
            )
          }
        }
      }
    }
  }
}

// -------------------------------------------------------------------------- //
// MARK: Arity-6
// -------------------------------------------------------------------------- //

@inlinable
internal func coalesceMovementAttemptDestinations<Position:AlgebraicProduct6>(
  _ a: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.A>,
  _ b: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.B>,
  _ c: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.C>,
  _ d: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.D>,
  _ e: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.E>,
  _ f: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.F>) -> IndexPositionStorageMovementAttemptDestination<Position> {
  switch a() {
  case .misnavigation:
    return .misnavigation
  case .becameEnd:
    return .becameEnd
  case .success(let aPosition):
    switch b() {
    case .misnavigation:
      return .misnavigation
    case .becameEnd:
      return .becameEnd
    case .success(let bPosition):
      switch c() {
      case .misnavigation:
        return .misnavigation
      case .becameEnd:
        return .becameEnd
      case .success(let cPosition):
        switch d() {
        case .misnavigation:
          return .misnavigation
        case .becameEnd:
          return .becameEnd
        case .success(let dPosition):
          switch e() {
          case .misnavigation:
            return .misnavigation
          case .becameEnd:
            return .becameEnd
          case .success(let ePosition):
            switch f() {
            case .misnavigation:
              return .misnavigation
            case .becameEnd:
              return .becameEnd
            case .success(let fPosition):
              return .success(
                Position(
                  aPosition,
                  bPosition,
                  cPosition,
                  dPosition,
                  ePosition,
                  fPosition
                )
              )
            }
          }
        }
      }
    }
  }
}

// -------------------------------------------------------------------------- //
// MARK: Arity-7
// -------------------------------------------------------------------------- //

@inlinable
internal func coalesceMovementAttemptDestinations<Position:AlgebraicProduct7>(
  _ a: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.A>,
  _ b: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.B>,
  _ c: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.C>,
  _ d: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.D>,
  _ e: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.E>,
  _ f: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.F>,
  _ g: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.G>) -> IndexPositionStorageMovementAttemptDestination<Position> {
  switch a() {
  case .misnavigation:
    return .misnavigation
  case .becameEnd:
    return .becameEnd
  case .success(let aPosition):
    switch b() {
    case .misnavigation:
      return .misnavigation
    case .becameEnd:
      return .becameEnd
    case .success(let bPosition):
      switch c() {
      case .misnavigation:
        return .misnavigation
      case .becameEnd:
        return .becameEnd
      case .success(let cPosition):
        switch d() {
        case .misnavigation:
          return .misnavigation
        case .becameEnd:
          return .becameEnd
        case .success(let dPosition):
          switch e() {
          case .misnavigation:
            return .misnavigation
          case .becameEnd:
            return .becameEnd
          case .success(let ePosition):
            switch f() {
            case .misnavigation:
              return .misnavigation
            case .becameEnd:
              return .becameEnd
            case .success(let fPosition):
              switch g() {
              case .misnavigation:
                return .misnavigation
              case .becameEnd:
                return .becameEnd
              case .success(let gPosition):
                return .success(
                  Position(
                    aPosition,
                    bPosition,
                    cPosition,
                    dPosition,
                    ePosition,
                    fPosition,
                    gPosition
                  )
                )
              }
            }
          }
        }
      }
    }
  }
}

// -------------------------------------------------------------------------- //
// MARK: Arity-8
// -------------------------------------------------------------------------- //

@inlinable
internal func coalesceMovementAttemptDestinations<Position:AlgebraicProduct8>(
  _ a: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.A>,
  _ b: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.B>,
  _ c: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.C>,
  _ d: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.D>,
  _ e: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.E>,
  _ f: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.F>,
  _ g: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.G>,
  _ h: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.H>) -> IndexPositionStorageMovementAttemptDestination<Position> {
  switch a() {
  case .misnavigation:
    return .misnavigation
  case .becameEnd:
    return .becameEnd
  case .success(let aPosition):
    switch b() {
    case .misnavigation:
      return .misnavigation
    case .becameEnd:
      return .becameEnd
    case .success(let bPosition):
      switch c() {
      case .misnavigation:
        return .misnavigation
      case .becameEnd:
        return .becameEnd
      case .success(let cPosition):
        switch d() {
        case .misnavigation:
          return .misnavigation
        case .becameEnd:
          return .becameEnd
        case .success(let dPosition):
          switch e() {
          case .misnavigation:
            return .misnavigation
          case .becameEnd:
            return .becameEnd
          case .success(let ePosition):
            switch f() {
            case .misnavigation:
              return .misnavigation
            case .becameEnd:
              return .becameEnd
            case .success(let fPosition):
              switch g() {
              case .misnavigation:
                return .misnavigation
              case .becameEnd:
                return .becameEnd
              case .success(let gPosition):
                switch h() {
                case .misnavigation:
                  return .misnavigation
                case .becameEnd:
                  return .becameEnd
                case .success(let hPosition):
                  return .success(
                    Position(
                      aPosition,
                      bPosition,
                      cPosition,
                      dPosition,
                      ePosition,
                      fPosition,
                      gPosition,
                      hPosition
                    )
                  )
                }
              }
            }
          }
        }
      }
    }
  }
}

// -------------------------------------------------------------------------- //
// MARK: Arity-9
// -------------------------------------------------------------------------- //

@inlinable
internal func coalesceMovementAttemptDestinations<Position:AlgebraicProduct9>(
  _ a: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.A>,
  _ b: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.B>,
  _ c: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.C>,
  _ d: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.D>,
  _ e: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.E>,
  _ f: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.F>,
  _ g: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.G>,
  _ h: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.H>,
  _ i: @autoclosure () -> IndexPositionStorageMovementAttemptDestination<Position.I>) -> IndexPositionStorageMovementAttemptDestination<Position> {
  switch a() {
  case .misnavigation:
    return .misnavigation
  case .becameEnd:
    return .becameEnd
  case .success(let aPosition):
    switch b() {
    case .misnavigation:
      return .misnavigation
    case .becameEnd:
      return .becameEnd
    case .success(let bPosition):
      switch c() {
      case .misnavigation:
        return .misnavigation
      case .becameEnd:
        return .becameEnd
      case .success(let cPosition):
        switch d() {
        case .misnavigation:
          return .misnavigation
        case .becameEnd:
          return .becameEnd
        case .success(let dPosition):
          switch e() {
          case .misnavigation:
            return .misnavigation
          case .becameEnd:
            return .becameEnd
          case .success(let ePosition):
            switch f() {
            case .misnavigation:
              return .misnavigation
            case .becameEnd:
              return .becameEnd
            case .success(let fPosition):
              switch g() {
              case .misnavigation:
                return .misnavigation
              case .becameEnd:
                return .becameEnd
              case .success(let gPosition):
                switch h() {
                case .misnavigation:
                  return .misnavigation
                case .becameEnd:
                  return .becameEnd
                case .success(let hPosition):
                  switch i() {
                  case .misnavigation:
                    return .misnavigation
                  case .becameEnd:
                    return .becameEnd
                  case .success(let iPosition):
                    return .success(
                      Position(
                        aPosition,
                        bPosition,
                        cPosition,
                        dPosition,
                        ePosition,
                        fPosition,
                        gPosition,
                        hPosition,
                        iPosition
                      )
                    )
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
