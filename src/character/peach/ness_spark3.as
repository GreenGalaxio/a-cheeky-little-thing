// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_spark3

package 
{
    import flash.display.MovieClip;

    public dynamic class ness_spark3 extends MovieClip 
    {

        public function ness_spark3()
        {
            addFrameScript(8, this.frame9);
        }

        internal function frame9():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

