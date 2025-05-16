// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//bomberman_fla.Bomberman_Defend_63

package bomberman_fla
{
    import flash.display.MovieClip;

    public dynamic class Bomberman_Defend_63 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var itemBox:MovieClip;

        public function Bomberman_Defend_63()
        {
            addFrameScript(4, this.frame5);
        }

        internal function frame5():*
        {
            gotoAndPlay("loop");
        }


    }
}//package bomberman_fla

